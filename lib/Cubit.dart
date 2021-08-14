
abstract class NewsState{}

 class NewsInitialState extends NewsState {}

 class NewsBottomNavState extends NewsState {}


 class NewsGetBusinessLoadingState extends NewsState {}
 class NewsGetBusinessSuccessState extends NewsState {}
 class NewsGetBusinessErrorState extends NewsState
{

 final String error ;

 NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsState {}
class NewsGetSportsSuccessState extends NewsState {}
class NewsGetSportsErrorState extends NewsState
{

 final String error ;

 NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsState {}
class NewsGetScienceSuccessState extends NewsState {}
class NewsGetScienceErrorState extends NewsState
{

 final String error ;

 NewsGetScienceErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsState {}
class NewsGetSearchSuccessState extends NewsState {}
class NewsGetSearchErrorState extends NewsState
{

 final String error ;

 NewsGetSearchErrorState(this.error);
}



class AppChaneModeState extends NewsState{}