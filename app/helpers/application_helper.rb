# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def setup(options)
        @title = "Twetter / #{options[:title]}" || "Twetter"
        @body_id = options[:body_id] || "body"
        @body_classes = options[:body_classes] || "account"
    end

  def promotions
    [
      {:name => 'Rails&middot;camp', :part => 'n.', :text => 'Hermanos, hacking and hops. The good life.'},
      {:name => 'Rails&middot;camp', :part => 'n.', :text => 'Brews, bros and brains. The good life.'},

      {:name => 'La&middot;del', :part => 'n.', :text => 'Traditionally used for serving food, employed during the camp for powerful drinking.'},

      {:name => 'Cer&middot;ve&middot;za', :part => 'n.', :text => 'Ponerse al día con sus compañeros y disfrutando de unas cervezas es un orgullo la tradición celebrada Railscamp.'},
      {:name => 'Bier', :part => 'n.', :text => 'Aufholjagd mit Kumpels und genießen ein paar Bier ist eine stolz erhobenem Railscamp Tradition.'},
      {:name => 'Yel&middot;low', :part => 'n.', :text => 'All you bitches better recognise.'},

      {:name => 'Mex&middot;i&middot;can', :part => 'n.', :text => "Don't ask; consume."},

      {:name => 'Gui&middot;tar He&middot;ro', :part => 'n.', :text => 'Because not all of us can be Eric Johnson.'},

      {:name => 'Ba&middot;na&middot;na&middot;jour', :part => 'n.', :text => 'A sinatra/bonjour app by <a href="/toolmantim">@toolmantim</a> for sharing publishing and discovering git repos. n.b.: There are no secret bananas.'},
      {:name => 'Duke&middot;jour', :part => 'n.', :text => "There's a party, and your iTunes library is invited.'"},
    ]
  end
end
