# Encoding: utf-8
Ohai.plugin(:InstalledServices) do
  provides 'installed_services'

  collect_data(:linux) do
    installed_services Mash.new
    initd = Dir.glob('/etc/init.d/*')
    init = Dir.glob('/etc/init/*')
    installed_services['initd'] = Array.new
    installed_services['init'] = Array.new
    for entries in initd do
        text = File.basename(entries)
        installed_services['initd'].push(text.split(' ')[0])
    end
    for entries in init do
        text = File.basename(entries)
        installed_services['init'].push(text.split('.conf')[0])
    end
  end
end