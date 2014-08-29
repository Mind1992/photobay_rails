describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:user_name)}

  it "validate case insensitive uniqueness of email" do
    user = User.create(user_name: "MICKY", email: "micky89@gmail.com", password: "1234", password_confirmation: "1234")
    user2 = User.new(user_name: "MICKY", email: "MICKY89@GMAIL.COM", password: "1234", password_confirmation: "1234")
    expect(user2.save).to eq false
  end

  it "validate case insensitive uniqueness of user name" do
    user = User.create(user_name: "micky", email: "micky89@gmail.com", password: "1234", password_confirmation: "1234")
    user2 = User.new(user_name: "MICKY", email: "MICKY89@GMAIL.COM", password: "1234", password_confirmation: "1234")
    expect(user2.save).to eq false
  end

  it "downcases a user name  before saving" do
    user = User.create(user_name: "MICKY", email: "MICKY89@GMAIL.COM", password: "1234", password_confirmation: "1234")
    expect(user.user_name).to eq "micky"
  end

  it "downcases an email before saving" do
    user = User.create(user_name: "MICKY", email: "MICKY89@GMAIL.COM", password: "1234", password_confirmation: "1234")
    expect(user.email).to eq "micky89@gmail.com"
  end

  it "requires the email address to look like an email" do
    user = User.create(user_name: "micky", email: "micky", password: "1234", password_confirmation: "1234")
    expect(user).to_not be_valid
  end
end

