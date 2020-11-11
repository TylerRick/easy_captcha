module EasyCaptcha
  # helper class for ActionView
  module ViewHelpers
    # generate an image_tag for captcha image
    def captcha_tag(*args)
      options = { :alt => 'captcha', :width => EasyCaptcha.image_width, :height => EasyCaptcha.image_height }
      options.merge! args.extract_options!
      image_tag(captcha_path(:i => Time.now.to_i), options)
    end

    def consumer_captcha_tag(*args)
      options = { :alt => 'captcha', :width => EasyCaptcha.image_width, :height => EasyCaptcha.image_height } # TODO make narrower?
      options.merge! args.extract_options!
      image_tag(captcha_url(:i => Time.now.to_i, :consumer => true), options)
    end
  end
end
