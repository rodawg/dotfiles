u:Gem::Specification�[I"1.8.24:ETiI"redis-namespace; TU:Gem::Version[I"
1.3.2; TIu:	Time`h�    :@_zoneI"UTC; TI"Namespaces Redis commands.; TU:Gem::Requirement[[[I">=; TU;[I"0; TU;	[[[I">=; TU;[I"0; TI"	ruby; F[o:Gem::Dependency
:
@nameI"
redis; T:@requirementU;	[[[I"~>; TU;[I"
3.0.4; T:
@type:runtime:@prereleaseF:@version_requirementsU;	[[[I"~>; TU;[I"
3.0.4; To;

;I"	rake; T;U;	[[[I">=; TU;[I"0; T;:development;F;U;	[[[I">=; TU;[I"0; To;

;I"
rspec; T;U;	[[[I">=; TU;[I"0; T;;;F;U;	[[[I">=; TU;[I"0; T0[I"chris@ozmm.org; TI"hone02@gmail.com; TI"steve@steveklabnik.com; T[I"Chris Wanstrath; TI"Terence Lee; TI"Steve Klabnik; TI"�Adds a Redis::Namespace class which can be used to namespace calls
to Redis. This is useful when using a single instance of Redis with
multiple, different applications.
; TI"-http://github.com/resque/redis-namespace; TT@[ 