
#
# CBRAIN Project
#
# Copyright (C) 2008-2012
# The Royal Institution for the Advancement of Learning
# McGill University
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.  
#

require 'spec_helper'

describe "CoreModels" do
  
  let(:core_model) { Factory.create(:everyone_group) }
  let(:non_core_model) { Factory.create(:work_group) }
  
  describe "#core_model!" do
    it "should not allow model to be destroyed if called" do
      lambda { core_model.destroy }.should raise_error
    end
    
    it "should allow model to be destroyed if not called" do
      lambda { non_core_model.destroy }.should_not raise_error
    end
  end
  
  describe "#core_model?" do
    it "should return true for a core model" do
      core_model.core_model?.should be_true
    end
    
    it "should return false if not a core model" do
      non_core_model.core_model?.should be_false
    end
  end
end