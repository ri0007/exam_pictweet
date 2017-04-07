require "rails_helper"

describe "User" do
  describe "count_tweets" do
    user = FactoryGirl.create(:user)
    let(:user){ User.find(user.id) }

    it "最初は0である" do
      expect(user.count_tweets).to eq 0
    end

    it "そのユーザーがツイートしたら1になる" do
      Tweet.create(image: "", text: "test", user_id: user.id)
      expect(user.count_tweets).to eq 1
    end

    it "そのユーザのツイートが削除されたら0になる" do
      Tweet.all { |e|
        e.destroy
      }
      Tweet.create(image: "", text: "test", user_id: user.id)
      Tweet.first.destroy
      expect(user.count_tweets).to eq 0
    end
  end
end
