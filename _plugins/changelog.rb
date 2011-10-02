require 'git'

module Jekyll

  class ChangelogPage < Page
    def initialize(site, base, dir, changelog)
      @site = site
      @base = base
      @dir  = dir
      @name = 'changelog.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'changelog.html')
      self.data['changelog'] = changelog
    end
  end

  class ChangelogGenerator < Generator
    safe true

    def  generate(site)
      if site.layouts.key? 'changelog'
          dir = '.'
          g = Git.open(site.source)
          changelogs = []
          g.log.each do |l|
            message = Maruku.new(l.message.gsub('_', '\_')).to_html
            changelogs.push({
              'sha'      => l.sha,
              'date'     => l.date,
              'author'   => {
                'name'  => l.author.name,
                'email' => l.author.email
              },
              'committer' => {
                'name'  => l.committer.name,
                'email' => l.committer.email
              },
              'message'  => message
            })

          end
          write_changelog(site, dir, changelogs)
      end
    end

    def write_changelog(site, dir, changelog)
      changelog = ChangelogPage.new(site, site.source, dir, changelog)
      changelog.render(site.layouts, site.site_payload)
      changelog.write(site.dest)
      site.static_files << changelog
    end

  end

end

