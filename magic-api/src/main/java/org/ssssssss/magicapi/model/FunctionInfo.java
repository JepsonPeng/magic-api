package org.ssssssss.magicapi.model;

import com.fasterxml.jackson.core.type.TypeReference;
import org.ssssssss.magicapi.utils.JsonUtils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

public class FunctionInfo extends MagicEntity {

	private String path;

	private String description;

	private String returnType;

	private String mappingPath;

	private List<Parameter> parameters = Collections.emptyList();

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setParameter(String parameter) {
		try {
			this.parameters = JsonUtils.readValue(Objects.toString(parameter, "[]"), new TypeReference<List<Parameter>>() {
			});
		} catch (Throwable ignored) {
		}
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getMappingPath() {
		return mappingPath;
	}

	public void setMappingPath(String mappingPath) {
		this.mappingPath = mappingPath;
	}

	public String getReturnType() {
		return returnType;
	}

	public void setReturnType(String returnType) {
		this.returnType = returnType;
	}

	public List<Parameter> getParameters() {
		return parameters;
	}

	public void setParameters(List<Parameter> parameters) {
		this.parameters = parameters;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		FunctionInfo functionInfo = (FunctionInfo) o;
		return Objects.equals(id, functionInfo.id) &&
				Objects.equals(path, functionInfo.path) &&
				Objects.equals(script, functionInfo.script) &&
				Objects.equals(name, functionInfo.name) &&
				Objects.equals(groupId, functionInfo.groupId) &&
				Objects.equals(description, functionInfo.description) &&
				Objects.equals(parameters, functionInfo.parameters) &&
				Objects.equals(returnType, functionInfo.returnType);
	}


	@Override
	public int hashCode() {
		return Objects.hash(id, path, script, name, groupId, parameters, description, returnType);
	}

	public FunctionInfo copy(){
		FunctionInfo info = new FunctionInfo();
		info.setId(this.id);
		info.setName(this.name);
		info.setGroupId(this.groupId);
		info.setScript(this.script);
		info.setDescription(this.description);
		info.setParameters(this.parameters);
		info.setPath(this.path);
		info.setMappingPath(this.mappingPath);
		info.setReturnType(this.returnType);
		info.setProperties(this.properties);
		info.setLock(this.lock);
		return info;
	}
}
