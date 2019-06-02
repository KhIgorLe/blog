shared_examples 'change count object' do |klass, count|
  it 'in database' do
    expect { subject }.to change(klass, :count).by(count)
  end
end

shared_examples 'not change count object' do |klass|
  it 'in database' do
    expect { subject }.to_not change(klass, :count)
  end
end
