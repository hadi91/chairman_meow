require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do

  describe "update_order_status" do

    let(:order) { create(:order) }
    let(:mail) { OrderMailer.update_order_status(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Order has been updated")
      expect(mail.to).to eq(["email37@example.com"])
      expect(mail.from).to eq(["admin@chairman-meow.com"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Hi")
    # end
  end

end
