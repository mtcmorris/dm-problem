class Dmmodel
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :awesome, String, :default => "yes please"
end