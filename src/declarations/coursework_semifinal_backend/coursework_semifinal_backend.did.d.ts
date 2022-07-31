import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface Customer {
  'Sex' : boolean,
  'Name' : string,
  'Phone' : string,
  'Birthday' : string,
}
export interface _SERVICE {
  'createAccount' : ActorMethod<[string, string, string, boolean], boolean>,
  'delete_account' : ActorMethod<[bigint], boolean>,
  'instantiate' : ActorMethod<[string], undefined>,
  'update_account' : ActorMethod<
    [bigint, string, string, string, boolean],
    boolean,
  >,
  'view_all_entries' : ActorMethod<[], Array<[bigint, [] | [Customer]]>>,
  'view_entry' : ActorMethod<[bigint], Array<[bigint, [] | [Customer]]>>,
}
