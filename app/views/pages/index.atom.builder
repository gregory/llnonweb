atom_feed do |feed|   
  feed.title("Daily Deal")   
  feed.updated(@pages.first.created_at)
  @pages.each do |page|
    feed.entry(page) do |entry|
      entry.title(page.title)
      entry.content(page.content, :type => 'html')
      entry.author { |author| author.name("greg")}
      entry.updated(page.updated_at)
       entry.tag!('app:edited', Time.now)
    end
  end
end