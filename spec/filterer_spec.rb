describe JekyllPagesApi::Generator::Filterer do
  describe '#condense' do
    it "removes line breaks" do
      expect(subject.condense("foo\n   bar")).to eq('foo bar')
    end
  end
end
