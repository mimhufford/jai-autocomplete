#run
{
    start := current_time_monotonic();

    set_build_options_dc(.{do_output=false, write_added_strings=false});
    w := compiler_create_workspace("Target Program");
    options := get_build_options(w);
    options.output_type = .NO_OUTPUT;
    set_build_options(options, w);

    args := options.compile_time_command_line;
    
    if args.count < 4
    {
        print("ERROR: You must provide the jai file and struct you want to analyse.\n");
        print(" e.g.: jai autocomplete.jai - main.jai Table\n");
        return;
    }

    file := args[2];
    struct_name := args[3];

    compiler_begin_intercept(w);
    add_build_file(file, w);
    message_loop(w, struct_name);
    compiler_end_intercept(w);
    
    print("\nTime: %ms\n", to_microseconds(current_time_monotonic() - start)/1000.0);
}

message_loop :: (w: Workspace, struct_name: string)
{
    procedures : [..]*Code_Procedure_Header;

    while true
    {
        message := compiler_wait_for_message();

        if message.kind == .COMPLETE break;
        if message.kind != .TYPECHECKED continue;
 
        for procedure: (cast(*Message_Typechecked)message).procedure_headers
        {
            header := procedure.expression;
            if !header.name continue;

            for arg: header.arguments
            {
                type := arg.entry.base.type;
                while type.type == .POINTER  type = (cast(*Type_Info_Pointer)type).pointer_to;
                if type.type != .STRUCT continue;
                if (cast(*Type_Info_Struct)type).name != struct_name continue;
                array_add_if_unique(*procedures, header);
            }
        }
    }

    print("\nProcedures with '%' as a parameter:\n", struct_name);
    for procedures  print("- %: %:%\n", it.name, it.location.enclosing_load.fully_pathed_filename, it.location.l0);
}

#import "Basic";
#import "Compiler";