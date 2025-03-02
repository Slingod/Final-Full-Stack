module ApplicationHelper
    def is_video?(attachment)
      attachment.content_type.start_with?('video')
    end
  end
  