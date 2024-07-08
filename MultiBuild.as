void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("hid");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE-bsd.txt");
	
	project.add_required_project_include({
		"./"
	});

	properties.include_directories("./hidapi");
	properties.excluded_files("./VERSION");

	{
		MultiBuild::ScopedFilter _(project, "config.platform:Windows");
		properties.files("./windows/hid.c");
	}
}