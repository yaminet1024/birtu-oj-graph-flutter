import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_web.dart';
import 'package:grpclib/grpclib.dart';

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
      }else{
        _channelClient = GrpcWebClientChannel.xhr(Uri.parse("http://localhost:6060"));
      }
    }catch (e){
      _channelClient = GrpcWebClientChannel.xhr(Uri.parse("http://localhost:6060"));
    }
  }

  void sayHelloToGrpc() async{
    final helloStub = GreeterClient(_channelClient);
    var response = await helloStub.sayHello(HelloRequest()..name="i' ycp, love hechong");
    print(response.message);
  }



}