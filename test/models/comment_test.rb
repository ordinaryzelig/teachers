require 'test_helper'

describe Comment do

  describe '#users_to_email' do

    before do
    end

    it 'includes TeacherRequest owner, previous commenters' do
      donor         = Factories.donor(:email => '1@donor.com')
      another_donor = Factories.donor(:email => '2@donor.com')
      teacher_request = Factories.teacher_request
      teacher       = teacher_request.teacher

      donor_comment         = teacher_request.comments.create!(:user => donor)
      teacher_comment       = teacher_request.comments.create!(:user => teacher)
      another_donor_comment = teacher_request.comments.create!(:user => another_donor)

      another_donor_comment.users_to_email.to_a.sort.must_equal [donor, teacher].sort
    end

  end

end
