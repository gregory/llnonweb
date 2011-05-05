require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'opdvvW87GLaUrepyujPg', 'O4NHyNfhpvdkFq8cpcOi9zmYRR5gahc16riviFWPbE'
  provider :facebook, "147749211905466", "b682557c3bc08512d09ebc4b848d8d93"
    provider   :twitter, "9qCNdznVlzui2JUEcJkA", "Zl46s1AnESBEwoHzQjUhV99JsYBqnSz5SQCeuMIeg"
    provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end