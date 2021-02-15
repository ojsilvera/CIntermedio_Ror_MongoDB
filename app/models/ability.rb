class Ability
  include CanCan::Ability

  def initialize(user)
    # * si el usuario es responsible del post puede verlo, editarlo y borrarlo
    can :manage, Task, owner_id: user.id

    # * si el usuario es follower del post solo puede verlo
    can :read, Task do |t|
      participants = t.participant_ids
      user = user.id
      participants.map { |id_participant| user == id_participant }
    end

    # * si el usuario es propietario del post puede escribir notas
    can :create, Note do |n|
      # obtener el propietario de la tarea
      owner_id = Task.find(n.task_id).owner_id
      # obtener el pid del current user
      user_id = user.id
      # comparo si el current user es propietario de la tarea
      owner_id == user_id
    end
  end
end
