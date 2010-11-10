module ActiveSupport
  class MessageVerifier
    private
      # constant-time comparison algorithm to prevent timing attacks
      def secure_compare(a, b)
        if a.length == b.length
          result = 0
          for i in 0..(a.length - 1)
            result |= a[i].ord ^ b[i].ord # #ord calls added for ruby1.9
          end
          result == 0
        else
          false
        end
      end
  end
end
