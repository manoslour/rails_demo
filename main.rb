
$db_connection


def create_user(db_connection)

  # ....
  # db_connection.create()
end


Rspec.describe '' do
  let(:db_connection) { double }

  it 'does something' do
    expect(double).to receive(:create)
    create_user(db_connection)
  end
end


