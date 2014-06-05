module Peapod
  class Library
    def initialize(source)
      @source = source
    end

    def on_podcast_with_id(pod_id)
      PodcastProxy.new(@source, pod_id)
    end
  end

  class PodcastProxy
    def initialize(source, pod_id)
      @source = source
      @pod_id = pod_id
    end

    def set_suspended!(is_suspended)
      @source.set_suspended!(@pod_id, is_suspended)
    end

    def suspend!
      set_suspended!(true)
    end

    def unsuspend!
      set_suspended!(false)
    end

    def suspended?
      @source.suspended?(@pod_id)
    end
  end
end
