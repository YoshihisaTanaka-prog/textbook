json.extract! out_site, :id, :title, :url, :created_at, :updated_at
json.url out_site_url(out_site, format: :json)
