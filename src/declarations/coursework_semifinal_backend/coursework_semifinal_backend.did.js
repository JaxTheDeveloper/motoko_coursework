export const idlFactory = ({ IDL }) => {
  const Customer = IDL.Record({
    'Sex' : IDL.Bool,
    'Name' : IDL.Text,
    'Phone' : IDL.Text,
    'Birthday' : IDL.Text,
  });
  return IDL.Service({
    'createAccount' : IDL.Func(
        [IDL.Text, IDL.Text, IDL.Text, IDL.Bool],
        [IDL.Bool],
        [],
      ),
    'delete_account' : IDL.Func([IDL.Nat], [IDL.Bool], []),
    'instantiate' : IDL.Func([IDL.Text], [], ['oneway']),
    'update_account' : IDL.Func(
        [IDL.Nat, IDL.Text, IDL.Text, IDL.Text, IDL.Bool],
        [IDL.Bool],
        [],
      ),
    'view_all_entries' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Nat, IDL.Opt(Customer)))],
        [],
      ),
    'view_entry' : IDL.Func(
        [IDL.Nat],
        [IDL.Vec(IDL.Tuple(IDL.Nat, IDL.Opt(Customer)))],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
