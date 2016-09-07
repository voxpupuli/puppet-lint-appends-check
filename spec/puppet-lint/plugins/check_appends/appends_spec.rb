require 'spec_helper'

describe 'appends' do
  let(:msg) { 'The appends (+=) operator was used.' }

  context 'with fix disabled' do
    context 'when the appends operator is not used' do
      let(:code) do
        <<-EOS
        $foo    = ['bar', 'baz']
        $gary   = 'is loud'
        $people = {
          'tim' => 'is beardy',
          'nigel' => "isn't so much"
        }
        EOS
      end

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'when the appends operator is used' do
      let(:code) do
        <<-EOS
        $foo    += ['bar', 'baz']
        $gary   += 'is loud'
        $people += {
          'tim' => 'is beardy',
          'nigel' => "isn't so much"
        }
        EOS
      end

      it 'should detect 3 problems' do
        expect(problems).to have(3).problems
      end

      it 'should create warnings' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(17)
        expect(problems).to contain_warning(msg).on_line(2).in_column(17)
        expect(problems).to contain_warning(msg).on_line(3).in_column(17)
      end
    end
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'when the appends operator is not used' do
      let(:code) do
        <<-EOS
        $foo    = ['bar', 'baz']
        $gary   = 'is loud'
        $people = {
          'tim' => 'is beardy',
          'nigel' => "isn't so much"
        }
        EOS
      end

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'when the appends operator is used' do
      let(:code) do
        <<-EOS
        $foo    += ['bar', 'baz']
        $gary   += 'is loud'
        $people += {
          'tim' => 'is beardy',
          'nigel' => "isn't so much"
        }
        EOS
      end

      it 'should detect 3 problems' do
        expect(problems).to have(3).problems
      end

      it 'should create warnings' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(17)
        expect(problems).to contain_warning(msg).on_line(2).in_column(17)
        expect(problems).to contain_warning(msg).on_line(3).in_column(17)
      end

      it 'should not fix the ensure parameter because that is not implemented' do
        expect(manifest).to eq(code)
      end
    end
  end
end
