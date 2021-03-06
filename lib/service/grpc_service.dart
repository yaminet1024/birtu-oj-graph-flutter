// import 'dart:ffi';
import 'dart:io';

// import 'package:fixnum/fixnum.dart';
import 'package:educational_robot/service/qa_service.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';
import 'package:grpclib/grpclib.dart';

typedef onResult = void Function(int errCode, List<ProblemEntity> result, int pageSize);

class GrpcService{
  factory GrpcService() => _getInstance();

  static GrpcService _instance;

  var _channelClient;


  GrpcService._internal(){
    _initGrpcChannel();
  }

  static GrpcService _getInstance(){
    if (_instance == null) {
      _instance = new GrpcService._internal();
    }
    return _instance;
  }

  _initGrpcChannel(){
    try{
      if(Platform.isAndroid || Platform.isIOS){
        _channelClient = ClientChannel(
          'localhost',
          port: 9090,
          options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
        );
      }
    }catch (e){
     _channelClient = GrpcWebClientChannel.xhr(Uri.parse("http://ttl317.top:6060"));
    }
  }

  void sayHelloToGrpc() async{
    final helloStub = GreeterClient(_channelClient);
    var response = await helloStub.sayHello(HelloRequest()..name="i' ycp, love hechong");
    print(response.message);
  }


  getProblem(index, onResult) async{
    final problemStub = ProblemServiceClient(_channelClient);
    var requestParams = new ProblemRequest()
                            ..page = index
                            ..limit = 20;
    var response = await problemStub.getProblem(requestParams);
    onResult(response.resultMessage.errCode, response.problemList, response.pageSize);
  }

}
