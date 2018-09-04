module IndifferentHash
  refine Hash do
    def indifferent_access!
      self.default_proc = proc do |h, k|
        case k
        when String then sym = k.to_sym; h[sym] if h.key?(sym)
        when Symbol then str = k.to_s; h[str] if h.key?(str)
        end
      end
    end
  end
end
