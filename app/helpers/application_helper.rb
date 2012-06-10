# -*- coding: utf-8 -*-

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def setup(options)
        @title = "Twetter / #{options[:title]}" || "Twetter"
        @body_id = options[:body_id] || "body"
        @body_classes = options[:body_classes] || "account"
    end

  def browser
    # This is only a high-level setting - more rendering engine than anything.
    # e.g. '#side ul li a' need different padding in webkit.
    # Just going with the values twitter use.
    %w[safari firefox opera msie].detect {|token|
      request.user_agent.downcase[token]
    }
  end

  def promotions
    [
      {:name => 'Cer&middot;ve&middot;za', :part => 'n.', :text => 'Ponerse al día con sus compañeros y disfrutando de unas cervezas es un orgullo la tradición celebrada Railscamp.'},
      {:name => 'Bier', :part => 'n.', :text => 'Aufholjagd mit Kumpels und genießen ein paar Bier ist eine stolz erhobenem Railscamp Tradition.'},
      {:name => 'Ba&middot;na&middot;na&middot;jour', :part => 'n.', :text => 'A sinatra/bonjour app by @toolmantim for sharing publishing and discovering git repos. n.b.: There are no secret bananas.'}
    ]
  end
end
