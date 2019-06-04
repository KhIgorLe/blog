shared_examples 'valid format' do |field|
  ['Test names.', 'Te na.', 'Test format good.'].each do |value|
    it { should allow_value(value).for(field) }
  end
end

shared_examples 'not valid format' do |field|
  ['Test name', 'test name.', 't name.', 'Test n.', 'Tes.t name.'].each do |value|
    it { should_not allow_value(value).for(field) }
  end
end
