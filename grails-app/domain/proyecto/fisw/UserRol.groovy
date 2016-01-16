package proyecto.fisw

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserRol implements Serializable {

	private static final long serialVersionUID = 1

	User user
	Rol rol

	UserRol(User u, Rol r) {
		this()
		user = u
		rol = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserRol)) {
			return false
		}

		other.user?.id == user?.id && other.rol?.id == rol?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (rol) builder.append(rol.id)
		builder.toHashCode()
	}

	static UserRol get(long userId, long rol_SId) {
		criteriaFor(userId, rol_SId).get()
	}

	static boolean exists(long userId, long rol_SId) {
		criteriaFor(userId, rol_SId).count()
	}

	private static DetachedCriteria criteriaFor(long userId, long rol_SId) {
		UserRol.where {
			user == User.load(userId) &&
			rol == Rol.load(rol_SId)
		}
	}

	static UserRol create(User user, Rol rol_S, boolean flush = false) {
		def instance = new UserRol(user, rol_S)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(User u, Rol r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UserRol.where { user == u && rol == r }.deleteAll()

		if (flush) { UserRol.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(User u, boolean flush = false) {
		if (u == null) return

		UserRol.where { user == u }.deleteAll()

		if (flush) { UserRol.withSession { it.flush() } }
	}

	static void removeAll(Rol r, boolean flush = false) {
		if (r == null) return

		UserRol.where { rol == r }.deleteAll()

		if (flush) { UserRol.withSession { it.flush() } }
	}

	static constraints = {
		rol validator: { Rol r, UserRol ur ->
			if (ur.user == null || ur.user.id == null) return
			boolean existing = false
			UserRol.withNewSession {
				existing = UserRol.exists(ur.user.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['user', 'rol']
		version false
	}
}
