/* eslint-disable object-curly-spacing */
import { https } from "firebase-functions";
import Stripe from "stripe";
import * as admin from "firebase-admin";
import { Response } from "express";

const app = admin.initializeApp();

const STRIPE_SECRET_KEY = process.env.STRIPE_SECRET_KEY;
const stripeClient = new Stripe(STRIPE_SECRET_KEY ?? "");

export const stripePayEndpointMethodId = https.onRequest(async (req, res) => {
  console.log(req.method, req.body);

  if (req.method !== "POST") {
    res.status(403).send("Forbidden");
    return;
  }

  const data = req.body;
  const paymentMethodId = data.paymentMethodId;
  const items = data.items;
  const currency = data.currency;
  const useStripeSdk = data.useStripeSdk;

  const total = 1400;

  try {
    if (paymentMethodId) {
      console.log(paymentMethodId);
      const params: Stripe.PaymentIntentCreateParams = {
        payment_method: paymentMethodId,
        amount: total,
        currency: currency,
        confirm: true,
        use_stripe_sdk: useStripeSdk,
        automatic_payment_methods: {
          enabled: true,
          allow_redirects: "never",
        },
      };
      const intent = await stripeClient.paymentIntents.create(params);
      _generateResponse(intent, res);
    } else {
      res.status(400).send("Bad request");
    }
  } catch (e) {
    res.status(500).send(String(e));
  }
});

// eslint-disable-next-line require-jsdoc
function _generateResponse(intent: Stripe.PaymentIntent, res: Response) {
  if (intent.status === "requires_action") {
    res.status(200).json({
      clientSecret: intent.client_secret,
      requiresAction: true,
      status: intent.status,
    });
  } else if (intent.status === "requires_payment_method") {
    res.status(200).json({
      error: "Your card was denied, please provide a new payment method",
    });
  } else if (intent.status === "succeeded") {
    console.log(" Payment received!");
    res
      .status(200)
      .json({ clientSecret: intent.client_secret, status: intent.status });
  } else {
    res.status(200).json({ error: "Failed" });
  }
}
