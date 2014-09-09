describe "Exceptions", :unit => true do
  describe WinRM::WinRMAuthorizationError do

    let (:error) { WinRM::WinRMHTTPTransportError.new("Foo happened", 500) }

    it 'adds the response code to the message' do
      expect(error.message).to eq('Foo happened (500).')
    end

    it 'exposes the response code as an attribute' do
      expect(error.status_code).to eq 500
    end

    it 'is a winrm error' do
      expect(error).to be_kind_of(WinRM::WinRMError)
    end
  end

  describe WinRM::WinRMWSManFault do

    let (:error) { WinRM::WinRMWSManFault.new("fault text", 42) }

    it 'exposes the fault text as an attribute' do
      expect(error.fault_text).to eq('fault text')
    end

    it 'exposes the fault code as an attribute' do
      expect(error.fault_code).to eq 42
    end

    it 'is a winrm error' do
      expect(error).to be_kind_of(WinRM::WinRMError)
    end
  end
end
