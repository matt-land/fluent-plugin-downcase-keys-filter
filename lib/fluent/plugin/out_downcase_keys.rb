class Fluent::DowncaseKeyOutput < Fluent::Output
  Fluent::Plugin.register_output 'downcase_keys', self

  config_param :remove_tag_prefix, :string, default: nil
  config_param :append_tag, :string, default: 'downcased_keys'
  config_param :deep_rename, :bool, default: true

  def configure conf
    super

    @remove_tag_prefix = /^#{Regexp.escape @remove_tag_prefix}\.?/ if @remove_tag_prefix
  end

  def emit tag, es, chain
    es.each do |time, record|
      new_tag = @remove_tag_prefix ? tag.sub(@remove_tag_prefix, '') : tag
      new_tag = "#{new_tag}.#{@append_tag}".sub(/^\./, '')
      new_record = downcase_keys record
      Fluent::Engine.emit new_tag, time, new_record
    end

    chain.next
  end


  def downcase_keys record
    new_record = {}

    record.each do |key, value|

      if @deep_rename
        if value.is_a? Hash
          value = downcase_keys value
        elsif value.is_a? Array
          value = value.map { |v| v.is_a?(Hash) ? downcase_keys(v) : v }
        end
      end

      new_record[key.downcase] = value
    end

    new_record
  end

  def get_placeholder match_data
    placeholder = {}

    match_data.to_a.each_with_index do |e, idx|
      placeholder.store "${md[#{idx}]}", e
    end

    placeholder
  end

end
