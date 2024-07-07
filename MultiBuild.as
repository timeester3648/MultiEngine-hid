void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	properties.name("hid");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	properties.license("./LICENSE-bsd.txt");
	
	project.add_required_project_include({
		"./"
	});

	project.include_directories("./hidapi");
	project.excluded_files("./VERSION");

	{
		MultiBuild::ScopedFilter _(workspace, "config.platform:Windows");
		properties.files("./windows/hid.c");
	}
}