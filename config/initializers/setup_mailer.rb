ActionMailer::Base.smtp_settings = {
	:address                 => "smtp.gmail.com",
	:port                    => 587,
	:domain                  => "local",
	:user_name               => "geraldinearenass@gmail.com",
	:password                => "123456789geral",
	:authentication          => "plain",
	:enable_starttls_auto    => true
}
