require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'

module GitHub
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        301 => '301 Moved Permanently',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      DefaultTimeFormat = "%B %-d, %Y".freeze

      def post_date(item)
        strftime item[:created_at]
      end

      def strftime(time, format = DefaultTimeFormat)
        attribute_to_time(time).strftime(format)
      end

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://developer.snip.it/resource?page=2>; rel="next",'
              lines << '      <https://developer.snip.it/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end
    end

  USER = 
  {
    "admin"                   => true,
    "beta"                    => true,
    "comments_received_count" => 105,
    "created_at"              => "2011-11-02T04:16:31Z",
    "default_language"        => "english",
    "description"             => "Cheddar bunny monster.",
    "favorites_count"         => 221,
    "friends_count"           => 564,
    "id"                      => 2870,
    "img_url"                 => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
    "name"                    => "Jouhan Allende",
    "posts_count"             => 321,
    "public_folders_count"    => 27,
    "recent_folders"          => [
      {
        "color"               => nil,
        "id"                  => 16008,
        "image_url"           => "//d2fkwnqkeasf43.cloudfront.net/b232252c2d4a127f3212e88491dcf4085ec93a32-500x331.jpg",
        "small_image_url"     => "//d2fkwnqkeasf43.cloudfront.net/b232252c2d4a127f3212e88491dcf4085ec93a32-75x50.jpg",
        "subscriptions_count" => 36,
        "title"               => "Simple Health",
        "url_slug"            => "16008-Simple-Health"
      },
      {
        "color"               => "pink",
        "id"                  => 15965,
        "image_url"           => "//d2fkwnqkeasf43.cloudfront.net/760759ab2556dbcf084d415187199aa3d353736b-430x257.jpg",
        "small_image_url"     => "//d2fkwnqkeasf43.cloudfront.net/760759ab2556dbcf084d415187199aa3d353736b-84x50.jpg",
        "subscriptions_count" => 127,
        "title"               => "Celebrity Gossip",
        "url_slug"            => "15965-Celebrity-Gossip"
      },
      {
        "color"               => "blue",
        "id"                  => 13278,
        "image_url"           => "//d2fkwnqkeasf43.cloudfront.net/873331645fe1c801775c0cc2d01b79099090ef072d163dac11170f0cbf8aaa92-250x208.gif",
        "small_image_url"     => "//d2fkwnqkeasf43.cloudfront.net/873331645fe1c801775c0cc2d01b79099090ef072d163dac11170f0cbf8aaa92-250x208.gif",
        "subscriptions_count" => 302,
        "title"               => "Funny",
        "url_slug"            => "13278-Funny"
      },
      {
        "color"               => "lemon",
        "id"                  => 14807,
        "image_url"           => "//d2fkwnqkeasf43.cloudfront.net/32a797ea3a567aad3b346f80a48c8dbf9c2dbb6a-500x504.jpg",
        "small_image_url"     => "//d2fkwnqkeasf43.cloudfront.net/32a797ea3a567aad3b346f80a48c8dbf9c2dbb6a-50x50.jpg",
        "subscriptions_count" => 183,
        "title"               => "Fashion",
        "url_slug"            => "14807-Fashion"
      },
      {
        "color"               => nil,
        "id"                  => 19281,
        "image_url"           => "//d2fkwnqkeasf43.cloudfront.net/1a0ac5aeefd3d024c31d43ad8ad2a68c5fd3c99a-500x327.jpg",
        "small_image_url"     => "//d2fkwnqkeasf43.cloudfront.net/c22272a49af4fcd80847aa8d18de191c1897907f0275337fb02375cb6fe77060-250x250.jpg",
        "subscriptions_count" => 1,
        "title"               => "Muni Love",
        "url_slug"            => "19281-Muni-Love"
      }
    ],
    "share_on_timeline"       => true,
    "small_image_url"         => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
    "subscribers_count"       => 1372,
    "subscriptions_count"     => 151,
    "timeline_snoozed"        => false,
    "url_slug"                => "jouhan",
    "username"                => "jouhan",
    "views_count"             => 8087
  }

  USER_AUTH = 
  {
    "admin"                  => true,
    "beta"                   => true,
    "comments_email"         => true,
    "created_at"             => "2011-11-02T04:16:31Z",
    "default_language"       => "english",
    "description"            => "Cheddar bunny monster.",
    "email"                  => "ednella@gmail.com",
    "email_digest_frequency" => 1,
    "email_import_code"      => "jouhan.8gz8",
    "favorites_count"        => 221,
    "favorites_email"        => true,
    "fb_uid"                 => "24414127",
    "friend_joined_email"    => true,
    "friends_count"          => 564,
    "id"                     => 2870,
    "img_url"                => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
    "name"                   => "Jouhan Allende",
    "new_subscription_count" => 2529,
    "password_authed"        => false,
    "posts_count"            => 323,
    "product_email"          => true,
    "public_folders_count"   => 27,
    "recent_folders"         => [
      {
        "color"               => nil,
        "created_at"          => "2012-03-01T19:02:51Z",
        "description"         => "Impress your friends with all your random knowledge.",
        "group"               => {
          "blacklisted"          => false,
          "category_id"          => 10,
          "contributors_count"   => 145,
          "display_order"        => 130,
          "featured_folder_id"   => nil,
          "header_img_url"       => nil,
          "id"                   => 197,
          "posts_count"          => 564,
          "public_folders_count" => 182,
          "slug"                 => "brain-candy",
          "title"                => "Brain Candy"
        },
        "group_id"            => 197,
        "id"                  => 14531,
        "image"               => {
          "height" => 389,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/4cc674d914b8b0957a58cc149a8556debfaa4e3f4639191a06378a31a6e2907f-500x389.jpg",
          "width"  => 500
        },
        "last_snipped_at"     => "2012-09-07T22:37:11Z",
        "layout"              => nil,
        "listorder"           => nil,
        "posts_count"         => 34,
        "private"             => false,
        "subscriptions_count" => 23,
        "title"               => "Random Goodness",
        "updated_at"          => "2012-09-07T22:37:12Z",
        "url_slug"            => "14531-Random-Goodness",
        "user_id"             => 2870,
        "user_subscribing"    => false
      },
      {
        "color"               => "blue",
        "created_at"          => "2012-02-14T07:39:32Z",
        "description"         => nil,
        "group"               => {
          "blacklisted"          => false,
          "category_id"          => 10,
          "contributors_count"   => 277,
          "display_order"        => 100,
          "featured_folder_id"   => nil,
          "header_img_url"       => nil,
          "id"                   => 1886,
          "posts_count"          => 2655,
          "public_folders_count" => 278,
          "slug"                 => "lols",
          "title"                => "LOLs"
        },
        "group_id"            => 1886,
        "id"                  => 13278,
        "image"               => {
          "height" => 208,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/873331645fe1c801775c0cc2d01b79099090ef072d163dac11170f0cbf8aaa92-250x208.gif",
          "width"  => 250
        },
        "last_snipped_at"     => "2012-09-07T21:17:19Z",
        "layout"              => nil,
        "listorder"           => nil,
        "posts_count"         => 54,
        "private"             => false,
        "subscriptions_count" => 302,
        "title"               => "Funny",
        "updated_at"          => "2012-09-07T21:17:19Z",
        "url_slug"            => "13278-Funny",
        "user_id"             => 2870,
        "user_subscribing"    => false
      },
      {
        "color"               => nil,
        "created_at"          => "2012-03-26T20:34:23Z",
        "description"         => nil,
        "group"               => {
          "blacklisted"          => false,
          "category_id"          => 21,
          "contributors_count"   => 156,
          "display_order"        => 100,
          "featured_folder_id"   => nil,
          "header_img_url"       => nil,
          "id"                   => 185,
          "posts_count"          => 1001,
          "public_folders_count" => 168,
          "slug"                 => "health",
          "title"                => "Health"
        },
        "group_id"            => 185,
        "id"                  => 16008,
        "image"               => {
          "height" => 331,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/b232252c2d4a127f3212e88491dcf4085ec93a32-500x331.jpg",
          "width"  => 500
        },
        "last_snipped_at"     => "2012-09-07T06:43:00Z",
        "layout"              => nil,
        "listorder"           => nil,
        "posts_count"         => 9,
        "private"             => false,
        "subscriptions_count" => 36,
        "title"               => "Simple Health",
        "updated_at"          => "2012-09-07T06:43:00Z",
        "url_slug"            => "16008-Simple-Health",
        "user_id"             => 2870,
        "user_subscribing"    => false
      },
      {
        "color"               => "pink",
        "created_at"          => "2012-03-26T00:37:58Z",
        "description"         => nil,
        "group"               => {
          "blacklisted"          => false,
          "category_id"          => 23,
          "contributors_count"   => 17,
          "display_order"        => 160,
          "featured_folder_id"   => nil,
          "header_img_url"       => nil,
          "id"                   => 12509,
          "posts_count"          => 66,
          "public_folders_count" => 18,
          "slug"                 => "celebs",
          "title"                => "Celebs"
        },
        "group_id"            => 12509,
        "id"                  => 15965,
        "image"               => {
          "height" => 257,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/760759ab2556dbcf084d415187199aa3d353736b-430x257.jpg",
          "width"  => 430
        },
        "last_snipped_at"     => "2012-09-07T02:07:03Z",
        "layout"              => nil,
        "listorder"           => nil,
        "posts_count"         => 16,
        "private"             => false,
        "subscriptions_count" => 127,
        "title"               => "Celebrity Gossip",
        "updated_at"          => "2012-09-07T02:07:03Z",
        "url_slug"            => "15965-Celebrity-Gossip",
        "user_id"             => 2870,
        "user_subscribing"    => false
      },
      {
        "color"               => "lemon",
        "created_at"          => "2012-03-07T18:57:48Z",
        "description"         => nil,
        "group"               => {
          "blacklisted"          => false,
          "category_id"          => 39,
          "contributors_count"   => 111,
          "display_order"        => 100,
          "featured_folder_id"   => nil,
          "header_img_url"       => nil,
          "id"                   => 62,
          "posts_count"          => 1955,
          "public_folders_count" => 118,
          "slug"                 => "fashion",
          "title"                => "Fashion"
        },
        "group_id"            => 62,
        "id"                  => 14807,
        "image"               => {
          "height" => 504,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/32a797ea3a567aad3b346f80a48c8dbf9c2dbb6a-500x504.jpg",
          "width"  => 500
        },
        "last_snipped_at"     => "2012-09-07T00:33:11Z",
        "layout"              => nil,
        "listorder"           => nil,
        "posts_count"         => 22,
        "private"             => false,
        "subscriptions_count" => 183,
        "title"               => "Fashion",
        "updated_at"          => "2012-09-07T00:33:11Z",
        "url_slug"            => "14807-Fashion",
        "user_id"             => 2870,
        "user_subscribing"    => false
      }
    ],
    "resnip_email"           => true,
    "share_on_timeline"      => true,
    "signup_status"          => 3,
    "small_image_url"        => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
    "subscribers_count"      => 1373,
    "subscriptions_count"    => 151,
    "subscriptions_email"    => true,
    "timeline_snoozed"       => false,
    "tw_screenname"          => "jouhanallende",
    "url_slug"               => "jouhan",
    "username"               => "jouhan",
    "views_count"            => 8153
  }

  MY_FOLDERS = 
  {
    "folders" => [
      {
        "id"       => 16289,
        "title"    => "Alcohol Science",
        "url_slug" => "16289-Alcohol-Science"
      },
      {
        "id"       => 16136,
        "title"    => "Bike Commuting 101",
        "url_slug" => "16136-Bike-Commuting-101"
      },
      {
        "id"       => 16396,
        "title"    => "Brain Health",
        "url_slug" => "16396-Brain-Health"
      },
      {
        "id"       => 15965,
        "title"    => "Celebrity Gossip",
        "url_slug" => "15965-Celebrity-Gossip"
      },
      {
        "id"       => 16327,
        "title"    => "Climbing",
        "url_slug" => "16327-Climbing"
      },
      {
        "id"       => 14714,
        "title"    => "Coffee",
        "url_slug" => "14714-Coffee"
      },
      {
        "id"       => 11444,
        "title"    => "Cute Food",
        "url_slug" => "11444-Cute-Food"
      },
      {
        "id"       => 25564,
        "title"    => "Documentaries",
        "url_slug" => "25564-Documentaries"
      },
      {
        "id"       => 15163,
        "title"    => "Exercise",
        "url_slug" => "15163-Exercise"
      },
      {
        "id"       => 14807,
        "title"    => "Fashion",
        "url_slug" => "14807-Fashion"
      },
      {
        "id"       => 13278,
        "title"    => "Funny",
        "url_slug" => "13278-Funny"
      },
      {
        "id"       => 14286,
        "title"    => "Half-Baked San Francisco News",
        "url_slug" => "14286-Half-Baked-San-Francisco-News"
      },
      {
        "id"       => 22577,
        "title"    => "Jouhan's Ego",
        "url_slug" => "22577-Jouhans-Ego"
      },
      {
        "id"       => 16269,
        "title"    => "Life Hacks",
        "url_slug" => "16269-Life-Hacks"
      },
      {
        "id"       => 19281,
        "title"    => "Muni Love",
        "url_slug" => "19281-Muni-Love"
      },
      {
        "id"       => 11443,
        "title"    => "Physical Feats",
        "url_slug" => "11443-Physical-Feats"
      },
      {
        "id"       => 16863,
        "title"    => "Pinterest, the Internet Drag Queen",
        "url_slug" => "16863-Pinterest-the-Internet-Drag-Queen"
      },
      {
        "id"       => 28291,
        "title"    => "Pop Stand",
        "url_slug" => "28291-Pop-Stand"
      },
      {
        "id"       => 16173,
        "title"    => "Programming Reads",
        "url_slug" => "16173-Programming-Reads"
      },
      {
        "id"       => 14531,
        "title"    => "Random Goodness",
        "url_slug" => "14531-Random-Goodness"
      },
      {
        "id"       => 16008,
        "title"    => "Simple Health",
        "url_slug" => "16008-Simple-Health"
      },
      {
        "id"       => 17148,
        "title"    => "Snip.it Mentions",
        "url_slug" => "17148-Snipit-Mentions"
      },
      {
        "id"       => 18410,
        "title"    => "Standing Desks and Hacks",
        "url_slug" => "18410-Standing-Desks-and-Hacks"
      },
      {
        "id"       => 12646,
        "title"    => "Taylor Swift",
        "url_slug" => "12646-Taylor-Swift"
      },
      {
        "id"       => 19428,
        "title"    => "Tech",
        "url_slug" => "19428-Tech"
      },
      {
        "id"       => 14098,
        "title"    => "The Gaga Inspired",
        "url_slug" => "14098-The-Gaga-Inspired"
      },
      {
        "id"       => 26200,
        "title"    => "UI and UX Reads",
        "url_slug" => "26200-UI-and-UX-Reads"
      },
      {
        "id"       => 15971,
        "title"    => "Upcycled Crafts",
        "url_slug" => "15971-Upcycled-Crafts"
      },
      {
        "id"       => 15738,
        "title"    => "Workspace",
        "url_slug" => "15738-Workspace"
      }
    ]
  }

  end
end

include GitHub::Resources::Helpers