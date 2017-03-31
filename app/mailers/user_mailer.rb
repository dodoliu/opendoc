class UserMailer < Devise::Mailer
   def confirmation_instructions(record, token, opts={})
    @user = record || User.new
    headers["Custom-header"] = "Bar"
    opts[:subject] = '注册确认邮件'
    opts[:from] = 'opendoc2017@163.com'
    opts[:reply_to] = @user.email
    super
  end
end
