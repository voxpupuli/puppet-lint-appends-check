PuppetLint.new_check(:appends) do
  def check
    tokens.each_with_index do |token, token_idx|
      if token.type == :APPENDS
        notify :warning, {
          :message => 'The appends (+=) operator was used.',
          :line    => token.line,
          :column  => token.column,
          :token   => token,
        }
      end
    end
  end
end
