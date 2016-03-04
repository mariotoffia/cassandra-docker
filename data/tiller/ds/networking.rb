require 'socket'

class NetworkingDataSource < Tiller::DataSource
  def global_values
   { 'ip' =>  IPSocket.getaddress(Socket.gethostname) }
  end
end