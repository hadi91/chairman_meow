require "rails_helper"

RSpec.describe OrderMailerMailer, type: :mailer do
  describe "update_order_status" do
    let(:mail) { OrderMailerMailer.update_order_status }

    it "renders the headers" do
      expect(mail.subject).to eq("Update order status")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end