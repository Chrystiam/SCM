ActionMailer::Base.smtp_settings = {
	:ssl                     => true,
	:address                 => "smtp.gmail.com",
	:port                    => 465,
	:domain                  => "local",
	:user_name               => "geraldinearenass@gmail.com",
	:password                => "123456789geral",
	:authentication          => "plain",
	:enable_starttls_auto    => false
}
