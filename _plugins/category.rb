module Jekyll
  
  class CategoryIndex < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir  = dir 
      @name = 'index.html'
      
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category
    end
  end
  
  class CategoryList < Page
    def initialize(site, base, dir, categories)
      @site = site
      @base = base
      @dir  = dir 
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_list.html')
      self.data['categories'] = categories
    end
  end
  
  class CategoryGenerator < Generator 
    safe true
    
    def generate(site)
      if site.layouts.key? 'category_index'
        dir = 'categories'
        site.categories.keys.each do |category|
          category_id = File.join(dir, category.gsub(/\s/, '-').gsub(/[^\w-]/, '').downcase)
          write_category_index(site, category_id, category)
        end
      end
      
      if site.layouts.key? 'category_list'
        dir = 'categories'
        write_category_list(site, dir, site.categories.keys.sort)
      end 
    end
    
    def write_category_index(site, dir, category)
      index = CategoryIndex.new(site, site.source, dir, category)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.static_files << index  
    end
    
    def write_category_list(site, dir, categories)
      index = CategoryList.new(site, site.source, dir, categories)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.static_files << index  
    end
    
  end
  
end