# Auth0のuid情報を持つユーザー
# 認証処理はAuth0に任せる
class User < ApplicationRecord
  has_many :collection_settings

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]

    self.find_or_create_by(provider: provider, uid: uid)
  end
end
