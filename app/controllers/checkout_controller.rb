class CheckoutController < ApplicationController 

    def create
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            subscription_data: {
              trial_period_days: 30,
            },
            line_items: [{
                id: @properties.id,
                amount: @properties.property_rent,
                currency: "usd",
                quantity: 1,
            }],
            mode: 'subscription',
            success_url: 'https://example.com/success',
            cancel_url: 'https://example.com/cancel',
          })

    end
end