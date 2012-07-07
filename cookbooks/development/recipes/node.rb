if node[:users]
  node[:users].each_pair do |username, info|
      
      node_installed = `which node`
      if node_installed.empty?
          home_dir = info[:home]
          node_dir = "#{home_dir}Downloads/"
          node_download = "#{node_dir}joyent-node-v0.8.1-0-g2134aa3.zip"
          node_extracted_dir = "#{node_dir}joyent-node/"

          execute "rm -rf #{node_download}"
          execute "rm -rf #{node_extracted_dir}"

          execute "wget 'https://github.com/joyent/node/zipball/v0.8.1' -O #{node_download}"
          execute "unzip #{node_download} -d #{node_extracted_dir}"
           
          execute "cd #{node_extracted_dir}joyent-node-fd97767/ && ./configure && make && make install"

          execute "npm install jasmine-node -g"
          execute "npm install jsdom"
          execute "npm install jasmine-jquery"
      end

  end
end
