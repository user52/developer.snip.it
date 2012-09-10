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

  USER_ME = USER.merge(
  {
    "comments_received_count" => 105,
    "new_subscription_count" => 2529,
    "views_count"            => 8153,
    "comments_email"         => true,
    "fb_uid"                 => "123445678",
    "password_authed"        => false,
    "subscriptions_email"    => true,
    "product_email"          => true,
    "email"                  => "<user.email@address.com>",
    "friend_joined_email"    => true,
    "favorites_email"        => true,
    "email_import_code"      => "user.4b5c",
    "email_digest_frequency" => 1,
    "signup_status"          => 3,
    "tw_screenname"          => "jouhanallende",
    "resnip_email"           => true,
  })

  MY_FOLDERS = 
  {
    "folders" => [
      {
        "id"       => 16289,
        "title"    => "Alcohol Science",
        "url_slug" => "16289-Alcohol-Science"
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

  FOLDER = 
  {
    "folder" => {
      "color"               => nil,
      "created_at"          => "2012-03-22T06:05:31Z",
      "description"         => "",
      "group"               => nil,
      "group_id"            => 1770,
      "id"                  => 15738,
      "image"               => {
        "height" => 319,
        "url"    => "//d2fkwnqkeasf43.cloudfront.net/77221e94ee907c9e447f248cce4b87964116b1403bc19a8a5e7b0d84af8c31d3-500x319.jpg",
        "width"  => 500
      },
      "last_snipped_at"     => "2012-04-06T22:24:20Z",
      "layout"              => nil,
      "listorder"           => nil,
      "posts_count"         => 2,
      "private"             => false,
      "subscriptions_count" => 1,
      "title"               => "Workspace",
      "updated_at"          => "2012-06-05T20:55:56Z",
      "url_slug"            => "15738-Workspace",
      "user"                => {
        "admin"                   => true,
        "beta"                    => true,
        "comments_received_count" => 105,
        "created_at"              => "2011-11-02T04:16:31Z",
        "default_language"        => "english",
        "description"             => "Cheddar bunny monster.",
        "favorites_count"         => 222,
        "friends_count"           => 564,
        "id"                      => 2870,
        "img_url"                 => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
        "name"                    => "Jouhan Allende",
        "posts_count"             => 326,
        "public_folders_count"    => 27,
        "share_on_timeline"       => true,
        "small_image_url"         => "//avatars-snip-it.s3.amazonaws.com/69/a276c4f4b5cf86a2462b70df56f5e3/jouhan-mustache.jpg",
        "subscribers_count"       => 1388,
        "subscriptions_count"     => 152,
        "timeline_snoozed"        => false,
        "url_slug"                => "jouhan",
        "username"                => "jouhan",
        "views_count"             => 8216
      },
      "user_id"             => 2870,
      "user_subscribing"    => false,
      "views"               => 81
    }
  }

  FOLDER_SUBSCRIBERS = 
  {
    "subscribers" => [
      {
        "description"     => "",
        "friend"          => false,
        "id"              => 351,
        "img_url"         => "//avatars-snip-it.s3.amazonaws.com/7f/b473c8c0dece96c8402244cfd172bb/avatar_sq.jpg",
        "name"            => "Cedric Han",
        "posts_count"     => 58,
        "small_image_url" => "//avatars-snip-it.s3.amazonaws.com/7f/b473c8c0dece96c8402244cfd172bb/avatar_sq.jpg",
        "subscribed_at"   => "2012-09-07T04:06:24Z",
        "updated_at"      => "2012-09-10T20:31:02Z",
        "url_slug"        => "cedric"
      }
    ]
  }

  FOLDER_SNIPS = 
  {
    "snips" => [
      {
        "alpha_post_id"   => nil,
        "caption"         => "I wouldn't mind a \"textpresso\" machine hanging around the office ;)",
        "comments"        => [],
        "comments_count"  => 0,
        "created_at"      => "2012-04-06T22:24:20Z",
        "description"     => "The coffee break is an inalienable right for every office worker. The problem is, between meetings and endless emails, it can be pretty hard to squeeze one in. Thanks to a new invention called the \"Textspresso\" we can shave off a few valuable minutes by texting our order to the coffee machine and simply do a drive by the break room to pick it up when ready.",
        "display_type"    => "fattie",
        "domain"          => "www.nbcbayarea.com",
        "favorites_count" => 0,
        "folder_id"       => 15738,
        "id"              => 123416,
        "image"           => {
          "height" => 319,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/77221e94ee907c9e447f248cce4b87964116b1403bc19a8a5e7b0d84af8c31d3-500x319.jpg",
          "width"  => 500
        },
        "source"          => "nbcbayarea",
        "title"           => "Text-Driven Coffee Machine Gives New Meaning to 'Instant Coffee'",
        "type"            => "url",
        "updated_at"      => "2012-06-30T01:42:50Z",
        "url"             => "http://www.nbcbayarea.com/news/local/Text-Driven-Coffee-Machine-Gives-New-Meaning-to-Instant-Coffee-146440315.html",
        "user_id"         => 2870
      },
      {
        "alpha_post_id"   => nil,
        "caption"         => "Engineering teams are more than the code they write. This article doesn't surprise me as much as the number of people that support it.",
        "comments"        => [],
        "comments_count"  => 0,
        "created_at"      => "2012-03-22T06:05:31Z",
        "description"     => "\"There are a million ways to lose a work day, but not even a single way to get one back.\" \"How does a large software project get to be one year late? Answer: One day at a time!\" It's trendy right now to produce office space that looks like an Apple store.",
        "display_type"    => "fattie",
        "domain"          => "mattrogish.com",
        "favorites_count" => 0,
        "folder_id"       => 15738,
        "id"              => 112742,
        "image"           => {
          "height" => 300,
          "url"    => "//d2fkwnqkeasf43.cloudfront.net/0be13949be8bcb4b08399da3054a989cbab843308e805f6bb22a7ac6b32742c4-501x300.jpg",
          "width"  => 501
        },
        "source"          => "mattrogish",
        "title"           => "Open plan offices must die!",
        "type"            => "url",
        "updated_at"      => "2012-06-30T01:42:50Z",
        "url"             => "http://mattrogish.com/blog/2012/03/17/open-plan-offices-must-die/",
        "user_id"         => 2870
      }
    ]
  }

  POST_COMMENTS = 
  {
    "comments" => [
      {
        "created_at" => "2012-09-07T04:48:48Z",
        "id"         => 6973,
        "message"    => "epic",
        "user"       => {
          "id"              => 48,
          "name"            => "Alaina",
          "small_image_url" => "//avatars-snip-it.s3.amazonaws.com/user/48/Alaina_Photo_small.jpg",
          "updated_at"      => "2012-09-10T21:42:19Z",
          "url_slug"        => "alaina"
        }
      },
      {
        "created_at" => "2012-09-07T07:31:36Z",
        "id"         => 6991,
        "message"    => "Wow!",
        "user"       => {
          "id"              => 4882,
          "name"            => "Maria Marem ",
          "small_image_url" => "//avatars-snip-it.s3.amazonaws.com/user/4882/Magician_by_ArhcamtIlnaad.jpg",
          "updated_at"      => "2012-09-10T21:19:34Z",
          "url_slug"        => "MariaMarem-4882"
        }
      }
    ]
  }



  end
end

include GitHub::Resources::Helpers