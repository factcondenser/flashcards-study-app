class StudyTimeWorker
  include Sidekiq::Worker

  def perform(notification_hsh)
    Webpush.payload_send(
      message: notification_hsh['message'],
      endpoint: notification_hsh['subscription']['endpoint'],
      p256dh: notification_hsh['subscription']['keys']['p256dh'],
      auth: notification_hsh['subscription']['keys']['auth'],
      vapid: {
        subject: 'mailto:sender@example.com',
        public_key: ENV['VAPID_PUBLIC_KEY'],
        private_key: ENV['VAPID_PRIVATE_KEY']
      }
    )
  end
end