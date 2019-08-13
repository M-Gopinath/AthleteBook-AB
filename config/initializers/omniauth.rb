OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '875094359264996','255c9698a7c500dab5b53d625e723458',:scope => 'email, user_friends'
  provider :instagram, '49873a0d67bd43b48b137e4fff7e15ef','284792c411774d9f8a52042cc1804e27'
  provider :google, '801872717152-72dhsa7i896lf15v69f55fc0auopfei2.apps.googleusercontent.com','GBM330UuGmZavlA8-gNzp6zG'
  provider :pinterest, '4857103578988293916','ab2f9aff488c1e9276a48b166004a93e754366dc09c9335e9d868816aefe76f3'
end

