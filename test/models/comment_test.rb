require 'test_helper'

describe Comment do

  describe '#users_to_email' do

    before do
    end

    it 'includes TeacherRequest owner, previous commenters' do
      donor         = Factories.donor(:email => '1@donor.com')
      another_donor = Factories.donor(:email => '2@donor.com')
      need_frosting = Factories.need_frosting
      teacher       = need_frosting.teacher

      donor_comment         = need_frosting.comments.create!(:user => donor)
      teacher_comment       = need_frosting.comments.create!(:user => teacher)
      another_donor_comment = need_frosting.comments.create!(:user => another_donor)

      another_donor_comment.users_to_email.to_a.must_equal [donor, teacher]
    end

  end

end
