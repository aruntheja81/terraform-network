# frozen_string_literal: true

public_nat_bastion =
  # The Terraform configuration under test must define the equivalently named
  # output
  attribute(
    "public_nat-bastion",
    description: "the bastion subnet"
  )

customized_inspec_attribute =
  # The Test Kitchen configuration must map this attribute to the
  # 'static_terraform_output' output
  attribute(
    "customized_inspec_attribute",
    description: "A configured alias for static_terraform_output"
  )

control "inspec_attributes" do
  desc "A demonstration of how InSpec attributes are mapped to Terraform outputs"

  describe "The 'public_nat-bastion' attribute" do
    subject do
      public_nat_bastion
    end

    it "is expected to include 10.0.0.0/24" do
      is_expected.to include "10.0.0.0/24"
    end
  end

end
