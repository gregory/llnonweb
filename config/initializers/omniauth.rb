Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'opdvvW87GLaUrepyujPg', 'O4NHyNfhpvdkFq8cpcOi9zmYRR5gahc16riviFWPbE'
  provider :facebook, "147749211905466", "b682557c3bc08512d09ebc4b848d8d93"
    provider :twitter, "fno1nY6Vx8G80mNFXKPukg", "UnTQrcu2nPG5bqTS3KYdRPkQ2wKgSZz4uBC1RRpRD0"
end